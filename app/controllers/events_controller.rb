class EventsController < ApplicationController
	before_filter :require_permission_events_administrate, :only => [:new, :create, :edit, :update, :destroy]
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    begin
      @event = Event.find(params[:id])
      @tickets = Event.connection.execute(<<ENDSQL)
        select count(t.id) as number, max(t.name), u.given_name, u.family_name, u.email, 
          tr.payment_media as pmt_media, tr.email as pmt_email, tr.payer_name as pmt_name 
          from registrations r 
          inner join tickets t on (r.ticket_id = t.id and t.event_id = #{params[:id]}) 
          left join users u on (r.purchaser_id = u.id) 
          left join transactions tr on (r.transaction_id = tr.id) group by u.id, t.id, tr.id order by u.family_name
ENDSQL

      puts @tickets.inspect
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @event }
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to events_path
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @event.addresses.build if @event.addresses.length == 0
    
    if(params[:show_id] && (show = Show.find(params[:show_id])))
      @event.show = show
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

		respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => _('Event was successfully created.')) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => _('Event was successfully updated.')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
