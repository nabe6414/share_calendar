json.array!(@plans) do |plan|
  json.group_id plan.group_id
  json.id plan.id
  json.title plan.title
  json.start plan.start
  json.end plan.end
end