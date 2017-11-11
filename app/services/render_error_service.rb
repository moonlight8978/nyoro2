module RenderErrorService
module_function

  def perform(**errors)
    errors.map do |_model, e|
      e.present? ? render_with(partial: 'components/form/errors', locals: { errors: e }) : ''
    end.join
  end

private

  def self.render_with(**args)
    ApplicationController.renderer.render(args)
  end
end
