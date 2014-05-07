class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :type

  def type
  	object.qtype.name if object.qtype
  end
end
