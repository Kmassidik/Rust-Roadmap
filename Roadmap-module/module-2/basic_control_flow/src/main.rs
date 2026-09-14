fn is_pass(score: u32) -> bool{
    score >= 60
}

fn grade(score: u32) -> &'static str {
    match score {
        90..=100 => "A",
        80..=89 => "B",
        70..=79 => "C",
        60..=69 => "D",
        _       => "E",
    }
}

fn print_result(name: &str, score: u32){
    let g = grade(score);
    let status  = if is_pass(score) {"Pass"} else {"Fail"};
    println! ("Name: {} | Score: {} | Grade: {} | Status : {}", name, score, g, status);
}

fn main() {
    let students = [
        ("Alice", 95),
        ("Bob", 82),
        ("Charlie", 73),
        ("Diana", 62),
        ("Eko", 32),
    ];


    println!("=== Student Report ===");
    let mut pass_count = 0;

    for (name, score) in students.iter(){
        print_result(name, *score);
        if is_pass(*score){
            pass_count += 1;
        }
    }

    println!("========================");
    println!("Total pass: {} from {}", pass_count, students.len());
}
