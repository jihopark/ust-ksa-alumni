#https://blog.engineyard.com/2015/active-model-serializers


class MajorSerializer < ActiveModel::Serializer
  attributes :id, :school, :name, :code
end
