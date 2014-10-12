class CategoriesDatatable

  delegate :params, :h, :link_to, :category_path, :edit_category_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      draw: params['draw'].to_i,
      recordsTotal: categories_total,
      recordsFiltered: filtered_categories_total,
      data: data
    }
  end

  private

  def categories_total
    Category.count
  end

  def filtered_categories_total
    filtered_categories.count
  end

  def data
    filtered_categories.page(page).per(per_page).map do |category|
      row = [
        category.name.html_safe,
        actions(category).html_safe
      ]
      row.compact
    end
  end

  def filtered_categories
    categories = Category.unscoped.order("#{sort_column} #{sort_direction}")
    if params['search']['value'].present?
      categories = categories.where("name ilike :search", search: "%#{params['search']['value']}%")
    end
    categories
  end

  def actions(category)
    link_to('Show', category_path(category)) + ' | ' +
    link_to('Edit', edit_category_path(category)) + ' | ' +
    link_to('Delete', category, method: :delete, data: { confirm: 'Are you sure?' })
  end

  def page
    params['start'].to_i/per_page + 1
  end

  def per_page
    params['length'].to_i > 0 ? params['length'].to_i : 10
  end

  def columns
    cols = [
      'name'
    ]
    cols.compact
  end

  def sort_column
    columns[params['order']['0']['column'].to_i]
  end

  def sort_direction
    params['order']['0']['dir'] == "desc" ? "desc" : "asc"
  end
end
