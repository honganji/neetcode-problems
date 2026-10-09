class LRUCache(capacity: Int) {
    private val cache = object : LinkedHashMap<Int, Int>(capacity, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<Int, Int>): Boolean {
            return size > capacity
        }
    }

    fun get(key: Int): Int {
        return cache[key] ?: -1
    }

    fun put(key: Int, value: Int) {
        cache[key] = value
    }
}
