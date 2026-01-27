use std::env;
use std::fs;
use std::path::Path;

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