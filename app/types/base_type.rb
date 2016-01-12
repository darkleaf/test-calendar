module BaseType
  extend ActiveSupport::Concern

  class_methods do
    delegate :model_name, :sti_name, to: :superclass

    def find_sti_class(type_name)
      klass = super type_name
      "#{klass}Type".constantize
    end
  end
end
