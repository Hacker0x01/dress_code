require 'redcarpet'
require 'pygments'
require_relative '../dress_code'

class DressCode::Renderer < Redcarpet::Render::HTML

  def block_code(code, language)
    syntax = Pygments.highlight(code, {
      lexer: language,
      options: { encoding: 'utf-8' }
    })
    inner = if language == 'html'
      "#{syntax} <div class='code-rendered'>#{code}</div>"
    else
      syntax
    end
    "#{inner}"
  end

end

