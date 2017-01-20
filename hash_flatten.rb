=begin
Pramp Question

input:
{
  'Key1': '1',
  'Key2': {
    'a' : '2',
    'b' : '3',
    'c' : {
      'd' : '3',
      'e' : '1'
      }
    }
}

output:
{
  'Key1': '1',
  'Key2.a': '2',
  'Key2.b' : '3',
  'Key2.c.d' : '3',
  'Key2.c.e' : '1'
} 

=end
  
def hash_flatten(hash)
  flattened_hash = Hash.new
  hash_flatten_rec("", hash, flattened_hash)
  return flattened_hash
end

def hash_flatten_rec(key, value, results)
  if value.class != Hash
    results[key] = value
    return
  end
  
  value.each_pair do |k, v|  
    prefix = (key.length == 0) ? "" : "#{key}."
    hash_flatten_rec("#{prefix}#{k}", v, results)
  end
end

hash = {
  'Key1'=> '1',
  'Key2'=> {
    'a' => '2',
    'b' => '3',
    'c' => {
      'd' => '3',
      'e' => '1'
      }
    }
}
pp hash_flatten(hash)

