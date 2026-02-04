use std::fs;

pub fn show_version() {
    let version = fs::read_to_string("lib/version.md").unwrap();
    println!("{}", version);
}