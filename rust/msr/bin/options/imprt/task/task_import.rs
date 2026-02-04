use std::env;
use std::fs;
use std::path::Path;

use msr::task_import_functions::{load_patterns, save_patterns};

pub fn import_patterns() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("使用法: {} <file>", args[0]);
        return;
    }
    let file = &args[1];
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    let import_content = fs::read_to_string(file).unwrap();
    let mut patterns = load_patterns(&pattern_file);
    for line in import_content.lines() {
        if !line.trim().is_empty() && !line.starts_with('#') {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() == 2 {
                patterns.push((parts[0].trim().to_string(), parts[1].trim().to_string()));
            }
        }
    }
    save_patterns(&pattern_file, &patterns);
    println!("パターンを {} からインポートしました", file);
}