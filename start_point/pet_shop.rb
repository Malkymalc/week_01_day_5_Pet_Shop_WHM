
#1
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

#2

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

#3
def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

#4

# See above


#5

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

#6

def increase_pets_sold(pet_shop, amount_sold)
  pet_shop[:admin][:pets_sold] += amount_sold

end


#7

def stock_count(pet_shop)
  return pet_shop[:pets].length
end


#8

def pets_by_breed(pet_shop, breed_wanted)
  pets_of_breed = []
  for pet in pet_shop[:pets]
    pets_of_breed.push(pet) if pet[:breed] == breed_wanted
  end
  return pets_of_breed
end

#9

# As above

#10

def find_pet_by_name(pet_shop, pet_name_wanted)
    for pet in pet_shop[:pets]
      return pet if pet[:name] == pet_name_wanted
    end
  return nil
end

#11

# As above

#12

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, pet_name))
end

#13

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

#14

def customer_cash(customer)
  return customer[:cash]
end

#15

def remove_customer_cash(customer, amount_to_remove)
  customer[:cash] -= amount_to_remove
end


#16

def customer_pet_count(customer)
  return customer[:pets].length
end

#17

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

#18

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

#19

def sell_pet_to_customer(pet_shop, pet, customer)
  return "Pet not found" if pet == nil
  return "Insufficient funds" unless customer_can_afford_pet(customer, pet)
  add_pet_to_customer(customer, pet)
  remove_customer_cash(customer, pet[:price])

  remove_pet_by_name(customer, pet)
  increase_pets_sold(pet_shop, 1)
  add_or_remove_cash(pet_shop, pet[:price])
end
