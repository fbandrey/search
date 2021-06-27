module Api
  class ProceduresController < ::ActionController::API

    def index
      @procedures =
        Procedure
          .select(search.select)
          .where(search.where)
          .order(search.order)

      render json: { procedures: @procedures }
    end

    private

    def search
      @search ||= ProceduresSearch.new(params[:q])
    end

  end
end
