class FamilyPdf
  include Prawn::View

  def initialize
    content
  end

  def content
    text "Hello World!"
  end
end
