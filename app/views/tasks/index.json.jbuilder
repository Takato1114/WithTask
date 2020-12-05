json.array!(@tasks) do |task|
  json.id task.id
  json.title task.title
  json.start task.start_date
  json.end task.end_date
  json.status task.status
end