package ru.vladlink.task.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import ru.vladlink.task.domain.Category;
import ru.vladlink.task.repository.CategoryRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public List<Category> getRootCategories() {
        return categoryRepository.findRootCategories();
    }
}
