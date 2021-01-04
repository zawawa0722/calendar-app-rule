json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.start event.start_time
  json.end event.end_time
  json.url event_url(event)
end

# json.array!(@events) do |event|
#   json.extract! event, :id, :title, :body
#   json.start event.start_time
#   json.end event.end_time
#   json.url event_url(event)
# end