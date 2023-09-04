Odin's `new_copy()` cannot know the deep structure of the Datum, e.g. if the Datum contains a pointer
hence, the Datum should provide its own `clone()` procedure


Message cloning does not work in full generality if the Datum contains a pointer.  Odin's `new_copy()` cannot know the deep structure of the Datum.  Only the Datum knows how it is implemented, hence, Datum should supply it's own `clone()` proc.  A programmer can Production Engineer a system by implementing memory-sharing via pointers, but Odin cannot know if that is intentional or not.
