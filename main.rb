DataItem = Struct.new(:key, :data)

SIZE=20
R=31
data_items=[]


def hash_code(key)

	if key.is_a? Integer
		key=key.to_s
	end
	hash=0
	key.each_byte do |byte|
		hash=(R * hash + byte) % SIZE
	end
	hash
end




def data_item(key)
	hash_index = hash_code(key)
end


def search(key, data_items)

	hash_index = hash_code(key)

	while(data_items[hash_index] != nil)
		if(data_items[hash_index].key == key)
			return data_items[hash_index].data
		end

		hash_index+=1

		hash_index %= SIZE
	end
	return nil
end


def insert(key, data, data_items)
	item = DataItem.new(key, data)
	item.data = data
	item.key = key

	hash_index = hash_code(key)

	while(data_items[hash_index] != nil && data_items[hash_index].key.to_i != -1)
		hash_index += 1
		hash_index %= SIZE
	end

	data_items[hash_index] = item


end
insert("test", "testin", data_items)
insert("test2", "testing34", data_items)
insert("test3", "testing492857", data_items)
insert("test4", "testin", data_items)
insert("test5", "testing34", data_items)
insert("test6", "testing492857", data_items)


p search("test", data_items)
p search("test6", data_items)
