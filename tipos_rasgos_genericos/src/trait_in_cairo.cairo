// Definición del trait Summary que define el comportamiento común
// para tipos que pueden ser resumidos
trait Summary<T> {
    // Método que debe ser implementado por cada tipo
    fn summarize(self: @T) -> ByteArray;

    // Método con implementación por defecto
    fn summarize_author(self: @T) -> ByteArray {
        "(Autor desconocido)"
    }
}

// Estructura para artículos de noticias
#[derive(Drop)]
struct NewsArticle {
    headline: ByteArray, // Título del artículo
    location: ByteArray, // Ubicación
    author: ByteArray, // Autor
    content: ByteArray // Contenido
}

// Implementación del trait Summary para NewsArticle
impl NewsArticleSummary of Summary<NewsArticle> {
    fn summarize(self: @NewsArticle) -> ByteArray {
        // Implementación personalizada para artículos
        format!("{} por {} ({})", self.headline, self.author, self.location)
    }

    fn summarize_author(self: @NewsArticle) -> ByteArray {
        // Sobreescribimos el método por defecto
        format!("Autor: {}", self.author)
    }
}

// Estructura para tweets
#[derive(Drop)]
struct Tweet {
    username: ByteArray, // Nombre de usuario
    content: ByteArray, // Contenido del tweet
    reply: bool, // Si es una respuesta
    retweet: bool // Si es un retweet
}

// Implementación del trait Summary para Tweet
impl TweetSummary of Summary<Tweet> {
    fn summarize(self: @Tweet) -> ByteArray {
        // Implementación personalizada para tweets
        format!("{}: {}", self.username, self.content)
    }

    fn summarize_author(self: @Tweet) -> ByteArray {
        // Sobreescribimos el método por defecto
        format!("@{}", self.username)
    }
}

// Función principal para demostrar el uso de traits
#[executable]
fn main() {
    // Crear un artículo de noticias
    let news = NewsArticle {
        headline: "Cairo El lenguaje del futuro",
        location: "Mundo",
        author: "Cairo Developer",
        content: "Cairo esta revolucionando el desarrollo de ZK",
    };

    // Crear un tweet
    let tweet = Tweet {
        username: "CairoFan",
        content: "Aprendiendo Cairo! #ZeroKnowledge",
        reply: false,
        retweet: false,
    };

    // Demostrar el uso de los métodos del trait
    println!("=== Demostracion de Traits en Cairo ===");
    println!("\nArticulo de Noticias:");
    println!("Resumen: {}", NewsArticleSummary::summarize(@news));
    println!("Autor: {}", NewsArticleSummary::summarize_author(@news));

    println!("\nTweet:");
    println!("Resumen: {}", TweetSummary::summarize(@tweet));
    println!("Autor: {}", TweetSummary::summarize_author(@tweet));
}
