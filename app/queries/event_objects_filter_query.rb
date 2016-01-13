module EventObjectsFilterQuery
  module_function

  def perform(start_date, end_date)
    return [] if [start_date, end_date].any? &:blank?

    sql = ActiveRecord::Base.send(:sanitize_sql_array, [<<-SQL, start_date, end_date])
      SELECT days.day AS start,
             events.id,
             events.name AS title,
             ('/events/' || events.id || '/edit') AS url
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


    res = ActiveRecord::Base.connection_pool.with_connection { |con| con.exec_query(sql) }
  end
end
