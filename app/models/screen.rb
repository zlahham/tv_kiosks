class Screen < ApplicationRecord

    belongs_to :department
    validates :department, presence: true

    before_create :assign_name

    def assign_name

      self.name = loop do
        random_name = SecureRandom.urlsafe_base64(nil, false)[0..3]
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
        end
    end
end
