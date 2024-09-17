import 'package:flutter/material.dart';
import 'book_page.dart'; // Import the file where MyHomePage is defined

class Book {
  final String title;
  final String author;
  final String coverImage;

  Book({required this.title, required this.author, required this.coverImage});
}

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final List<Book> _latestBooks = [
    Book(
      title: 'Fashionopolis',
      author: 'Dana Thomas',
      coverImage: 'assets/book_cover/Fashionopolis.png',
    ),
    Book(
      title: 'Chanel',
      author: 'Patrick Mauriès',
      coverImage: 'assets/book_cover/Chanel.png',
    ),
    Book(
      title: 'Calligraphy',
      author: 'June & Lu',
      coverImage: 'assets/book_cover/Calligraphy.png',
    ),
  ];

  final List<Book> _popularBooks = [
    Book(
      title: 'The Journey to the West',
      author: 'Wu Cheng\'en',
      coverImage: 'assets/book_cover/JourneyToTheWest.png',
    ),
    Book(
      title: 'The Book of Signs',
      author: 'Rudolf Koch',
      coverImage: 'assets/book_cover/The_Book_of_Signs.png',
    ),
  ];

  void _navigateToBookDetails(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyBookPage(
          title: book.title,
          author: book.author,
          coverImage: book.coverImage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile_pic.png'),
          ),
        ),
        title: const Text('Hi, Shubham!'),
        actions: [
          IconButton(
            onPressed: () {
              // Handle search action
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0, // Removes shadow
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Latest Added Books
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Latest Added Books',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _latestBooks.length,
                itemBuilder: (context, index) {
                  final book = _latestBooks[index];
                  return GestureDetector(
                    onTap: () => _navigateToBookDetails(book),
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            book.coverImage,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            book.author,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Popular Books
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular Books',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _popularBooks.length,
              itemBuilder: (context, index) {
                final book = _popularBooks[index];
                return ListTile(
                  leading: Image.asset(
                    book.coverImage,
                    height: 100,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: const Icon(Icons.bookmark_border),
                  onTap: () => _navigateToBookDetails(book),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Set background color to blue
        selectedItemColor: Colors.white, // White color for selected item
        unselectedItemColor:
            Colors.white.withOpacity(0.7), // Lighter white for unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, color: Colors.white),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
