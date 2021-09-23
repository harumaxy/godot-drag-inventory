extends Control

var item: Control = null

func can_drop_data(position, data):
  return item == null

func drop_data(position, data):
  print(data)
  print("dropped")
  var node: Control = data.node
  if node == null:
    return
  # update item slot
  if node.slot != null:
    node.slot.item = null
  self.item = node
  item.slot = self
  node.return_to_slot()
