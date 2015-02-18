
class HashTableArray
  attr_accessor :buckets
  
  def initialize
    @buckets = []
  end
  
  def compute_index(key)
    key.to_s.to_sym.object_id % 100
  end
  
  def insert(key, value)
    index = compute_index(key)
    buckets[index] ||= []
    buckets[index] << [key, value]
  end
  
  def find(key)
    index = compute_index(key)
    key_value_pairs = buckets[index]
    key_value_pairs.each do |key_value_pair|
      if key_value_pair[0] == key
        return key_value_pair[1]
      end
    end
  end
end

table = HashTableArray.new
table.insert("A", "a")
table.insert("B", "b")
table.insert("C", "c")
table.insert("D", "d")

table.find("A")
table.find("B")
table.find("C")
table.find("D")

