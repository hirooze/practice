use std::env;
use std::fs;
use std::path::Path;

pub fn add_pattern() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("使用法: {} <before> <after>", args[0]);
        return;
    }
    let before = &args[1];
    let after = &args[2];
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    let mut patterns = load_patterns(&pattern_file);
    patterns.push((before.clone(), after.clone()));
    save_patterns(&pattern_file, &patterns);
    println!("パターンを追加しました: {} -> {}", before, after);
}

fn load_patterns(pattern_file: &Path) -> Vec<(String, String)> {
    if !pattern_file.exists() {
        return vec![];
    }
    let content = fs::read_to_string(pattern_file).unwrap();
    content
        .lines()
        .filter(|line| !line.trim().is_empty() && !line.starts_with('#'))
        .map(|line| {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() == 2 {
                (parts[0].trim().to_string(), parts[1].trim().to_string())
            } else {
                ("".to_string(), "".to_string())
            }
        })
        .collect()
}

fn save_patterns(pattern_file: &Path, patterns: &[(String, String)]) {
    let mut lines: Vec<String> = patterns
        .iter()
        .map(|(b, a)| format!("{},{}", b, a))
        .collect();
    lines.sort();
    lines.dedup();
    let content = lines.join("\n");
    fs::write(pattern_file, content).unwrap();
}