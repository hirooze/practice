use std::env;
use std::fs;
use std::path::Path;

use msr::task_export_functions::load_patterns;

pub fn export_patterns() {
    let args: Vec<String> = env::args().collect();
    let file = if args.len() > 1 { &args[1] } else { "patterns.txt" };
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    let patterns = load_patterns(&pattern_file);
    let content = patterns
        .iter()
        .map(|(b, a)| format!("{},{}", b, a))
        .collect::<Vec<_>>()
        .join("\n");
    fs::write(file, content).unwrap();
    println!("パターンを {} にエクスポートしました", file);
}