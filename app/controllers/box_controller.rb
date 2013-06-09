class BoxController < ActionController::Base

  def create_box
    @box = Collective::UseCases::CreateBox.new(params[:box], optional_db_implementing_adapter).exec
    @box.ok? 
      redirect_to(boxes_path)
    else
      flash[:errors] = @box.errors
      render(:new)
    end
  end

end
