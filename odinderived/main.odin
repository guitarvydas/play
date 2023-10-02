Entity :: struct {
    id:          u64,
    name:        string,
    position:    Vector3,
    orientation: Quaternion,
}

Monster_details :: struct {
    is_robot:     bool,
    is_zombie:    bool,
}

Monster :: struct {
    entity: ^Entity,
    monster: ^Monster_details,
}

Monster_unrolled :: struct {
    entity: Entity,
    monster: Monster_details,
}

/* // See `parametric_polymorphism` procedure for details */
/* new_entity :: proc($T: typeid) -> ^Entity { */
/*     t := new(T) */
/*     t.derived = t^ */
/* 	return t */
/* } */

/* entity := new_entity(Monster) */

entity := new (Monster)
entity.derived = entity^
	       
switch e in entity.derived {
case Frog:
    fmt.println("Ribbit")
case Monster:
    if e.is_robot  { fmt.println("Robotic") }
    if e.is_zombie { fmt.println("Grrrr!")  }
    fmt.println("I'm a monster")
}
