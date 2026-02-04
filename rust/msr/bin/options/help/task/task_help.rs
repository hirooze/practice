use std::fs;

pub fn show_help() {
    let help = fs::read_to_string("lib/help.md").unwrap();
    println!("{}", help);
}