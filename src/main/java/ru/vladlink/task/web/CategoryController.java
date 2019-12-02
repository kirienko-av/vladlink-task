package ru.vladlink.task.web;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.vladlink.task.service.CategoryService;

@Controller
@AllArgsConstructor
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping(value = "/")
    public String getMenu(Model model) {
        model.addAttribute("categories", categoryService.getRootCategories());
        return "menu";
    }
}
