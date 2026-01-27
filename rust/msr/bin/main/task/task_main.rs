// 置換タスク
use std::env;
use std::fs;
use std::path::Path;

pub fn perform_replace() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("使用法: {} <ファイルまたは文字列>", args[0]);
        return;
    }
    let input = &args[1];
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    if Path::new(input).exists() {
        let content = fs::read_to_string(input).unwrap();
        let replaced = replace_with_patterns(&content, &pattern_file);
        println!("{}", replaced);
    } else {
        let replaced = replace_with_patterns(input, &pattern_file);
        println!("{}", replaced);
    }
}

fn replace_with_patterns(text: &str, pattern_file: &Path) -> String {
    let patterns = load_patterns(pattern_file);
    let mut result = text.to_string();
    for (before, after) in patterns {
        result = result.replace(&before, &after);
    }
    result
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