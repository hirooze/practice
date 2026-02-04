use std::fs;

pub fn show_help() {
    println!("{}", fs::read_to_string("lib/help.md").unwrap());
}

pub fn show_version() {
    println!("{}", fs::read_to_string("lib/version.md").unwrap());
}