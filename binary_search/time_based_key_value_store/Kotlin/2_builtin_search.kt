import java.util.TreeMap

class TimeMap() {
    private val store = HashMap<String, TreeMap<Int, String>>()

    fun set(key: String, value: String, timestamp: Int) {
        store.getOrPut(key) { TreeMap() }[timestamp] = value
    }

    fun get(key: String, timestamp: Int): String {
        val entries = store[key] ?: return ""
        return entries.floorEntry(timestamp)?.value ?: ""
    }
}
