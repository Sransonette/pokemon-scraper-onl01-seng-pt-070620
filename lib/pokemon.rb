require 'pry'

class Pokemon
  

  attr_accessor :id, :name, :type, :hp, :db
  

  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db

  end
  
   def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?);
    SQL
    
    db.execute(sql, [name, type])
    
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * 
      FROM pokemon 
      WHERE id = ?;
    SQL

    data = db.execute(sql, id).flatten
    #binding.pry
    Pokemon.new(id: data[0], name: data[1], type: data[2], db: db)
    #DB[:conn].execute(sql, [id]).flatten
    #self.new(id)

  end
  
  
  
end
