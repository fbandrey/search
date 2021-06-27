class ProceduresSearch

  def initialize(q)
    @q = q.to_s
  end

  def select
    Procedure::sanitize_sql_array(
      ["*, POSITION(LOWER(?) in LOWER(title)) AS position", @q]
    )
  end

  def where
    ['title ILIKE ?', search_string]
  end

  def order
    'position ASC, title ASC'
  end

  private

  def search_string
    ['%', @q.gsub(' ', '%'), '%'].join
  end

end
