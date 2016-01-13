module EventObjectsFilterQuery
  module_function

  def perform(start_date, end_date)
    return [] if [start_date, end_date].any? &:blank?

    sql = ActiveRecord::Base.send(:sanitize_sql_array, [<<-SQL, start_date, end_date])
      SELECT days.day,
             events.id,
             events.name
      FROM (
        SELECT seria AS day
        FROM generate_series(?::timestamp, ?::timestamp, '1 day') AS seria
      ) AS days
      JOIN LATERAL (
        SELECT *
        FROM events
        WHERE (events.repeat_period IS NULL AND days.day = events.date)
           OR (events.date <= days.day AND EXTRACT(epoch FROM days.day - events.date)::int % events.repeat_period = 0)
      ) as events ON true
    SQL

    result = ActiveRecord::Base.connection_pool.with_connection { |con| con.exec_query(sql) }

    result.map(&method(:row_to_event_object))
  end

  def row_to_event_object(row)
    {
        id: row['id'],
        title: row['name'],
        start: row['day'].to_date,
        url: Rails.application.routes.url_helpers.edit_event_path(row['id'])
    }
  end
end
