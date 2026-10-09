class LRUCache(capacity: Int) {
    private val capacity = capacity
    private val items = ArrayList<IntArray>()

    private fun find(key: Int): Int {
        for (i in items.indices) {
            if (items[i][0] == key) return i
        }
        return -1
    }

    fun get(key: Int): Int {
        val i = find(key)
        if (i == -1) return -1
        val pair = items.removeAt(i)
        items.add(pair)
        return pair[1]
    }

    fun put(key: Int, value: Int) {
        val i = find(key)
        if (i != -1) {
            items.removeAt(i)
        } else if (items.size == capacity) {
            items.removeAt(0)
        }
        items.add(intArrayOf(key, value))
    }
}
