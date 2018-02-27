class Screen < ApplicationRecord

    belongs_to :department
    validates :department, presence: true
    validates :name, presence: true, on: :create

    before_save :assign_name

    def assign_name

      self.name = loop do
        random_name = SecureRandom.hex(16)[0..3]
        break random_name unless Screen.exists?(name: random_name)
      end

    end

    rails_admin do
        configure :name do
          read_only true
        end

        edit do
          field :department_id, :enum do
            enum do
              Department.all.collect {|p| [p.name, p.id]}
            end
          end
          field :location
        end
    end
end
