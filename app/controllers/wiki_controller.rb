class WikiController < ApplicationController
  def preview
    @preview_text = params[:preview_text]

    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    #@preview_text = "test"
    render text: (redcarpet.render @preview_text).html_safe
  end
end
