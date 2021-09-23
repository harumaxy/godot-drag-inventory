extends Control

var picked := false
var slot: Control = null

func return_to_slot():
  picked = false
  self.mouse_filter = MOUSE_FILTER_PASS
  if slot:
    var offset = (slot.rect_size - self.rect_size) / 2
    $Tween.interpolate_property(self, "rect_position", rect_position, slot.rect_global_position + offset, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
    $Tween.start()

func _input(event):
  if event is InputEventMouseButton:
    if not event.is_pressed() and picked:
      return_to_slot()

func _process(dt):
  if picked:
    self.rect_position = get_global_mouse_position() - (self.texture.get_size() / 2)

func get_drag_data(_pos):
  var data = {node = self}
  print(data)
  picked = true
  self.mouse_filter = MOUSE_FILTER_IGNORE
  return data


