extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
    #All coordinates where dishes can spawn
    #TO-DO: Update coordinates based on final map/"house" layout
    var all_dish_placements = [
        Vector2(30, 40),
        Vector2(60, 40),
        Vector2(90, 40),
        Vector2(30, 60),
        Vector2(60, 60),
        Vector2(90, 60),
        Vector2(30, 80),
        Vector2(60, 80),
        Vector2(90, 80)
    ]

    #Shuffle the dish placements so we can randomize where the 6 dishes
    #are placed
    all_dish_placements.shuffle()

    #All dish nodes
    var all_dishes = [
        get_node("Dish1"),
        get_node("Dish2"),
        get_node("Dish3"),
        get_node("Dish4"),
        get_node("Dish5"),
        get_node("Dish6"),
    ]

    #Go through all our dishes and set their places
    var chosen_spot_count = 0
    for dish in all_dishes:
        dish.position = all_dish_placements[chosen_spot_count]
        chosen_spot_count += 1
