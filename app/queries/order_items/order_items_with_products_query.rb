class OrderItems::OrderItemsWithProductsQuery < Patterns::Query
  queries OrderItem

  private

  def query
    relation.from <<~SQL.squish
      (
        SELECT
          order_items.*,
          products.title AS product_title,
          products.price AS product_price,
          products.description AS product_description
        FROM order_items
        LEFT JOIN products
          ON order_items.product_id = products.id
        WHERE order_items.order_id = #{ order_id }
      ) order_items
    SQL
  end

  def order_id
    options.fetch(:order_id)
  end
end
