class FormSerializer < ActiveModel::Serializer
  attributes :id, :name, :preguntas

  def preguntas
  	object.questions.select(['id', 'title', 'qtype_id']) || nil
  end
end
