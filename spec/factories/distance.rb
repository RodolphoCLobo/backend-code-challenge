FactoryBot.define do
  factory :distance do
    factory :distance_1 do
      origin { 'a' }
      destination  { 'b' }
      kilometers { 10 }
    end

    factory :distance_2 do
      origin { 'b' }
      destination  { 'c' }
      kilometers { 15 }
    end

    factory :distance_3 do
      origin { 'a' }
      destination  { 'c' }
      kilometers { 30 }
    end
  end
end
