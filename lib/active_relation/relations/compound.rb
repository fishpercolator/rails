module ActiveRelation
  class Compound < Relation
    attr_reader :relation
    
    hash_on :relation
    
    delegate :joins, :selects, :orders, :groupings, :table_sql, :inserts, :take,
             :skip, :name, :alias, :aggregation?, :alias?, :prefix_for, :column_for,
             :engine,
             :to => :relation
    
    def attributes
      relation.attributes.collect { |a| a.bind(self) }
    end
    
    def qualify
      descend(&:qualify)
    end
  end
end