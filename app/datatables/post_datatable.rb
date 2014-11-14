class PostDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= [
      'posts.title',
      'categories.name'
    ]
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= [
      'posts.title',
      'categories.name'
    ]
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.title,
        record.category.try(:name)
      ]
    end
  end

  def get_raw_records
    # insert query here
    Post.includes(:category).references(:category)
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
