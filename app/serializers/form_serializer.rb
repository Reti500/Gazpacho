class FormSerializer < ActiveModel::Serializer

  attributes :id, :name
  has_one :project, embed: :objects
  has_many :questions, embed: :objects

  def preguntas
  	object.questions.select(['id', 'title', 'qtype_id']) || nil
  end
end
