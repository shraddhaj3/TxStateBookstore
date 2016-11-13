package txstatebookstore

class Author {
	static belongsTo = [book: Book]
	String authorName
	
	static constraints = {
		authorName(maxSize: 50)
		authorName(unique: ['authorName'])
	}
	
	@Override
	public String toString() {
		return authorName
	}
}
