class AttachmentsController < ApplicationController
  #before_filter :authenticate_user!
  def show
        if !user_signed_in?    
            redirect_to "/pages/new"
            return
        end
        @attachment = Attachment.find(params[:id])
        send_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
    end

    def create  
        if !user_signed_in?    
            redirect_to "/pages/new"
            return
        end
        return if params[:attachment].blank?

        @attachment = Attachment.new
        @attachment.uploaded_file = params[:attachment]

        if @attachment.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to :action => "index"
        else
            flash[:error] = "There was a problem submitting your attachment."
            render :action => "new"
        end
    end
    def index
        if !user_signed_in?    
            redirect_to "/pages/new"
            return
        end
        Attachment.all.each do |row|
            @filename = row.filename
            @link = "localhost:3000/attachments/show/"+row.id.to_s
        end
    end
end
