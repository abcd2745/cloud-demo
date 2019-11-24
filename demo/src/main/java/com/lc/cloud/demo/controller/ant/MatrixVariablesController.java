package com.lc.cloud.demo.controller.ant;

import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

/**
 * 矩阵，配合配置：setRemoveSemicolonContent（true)
 *
 * @see CustomWebMvcConfigurer
 */
@RestController
@RequestMapping("matrix")
public class MatrixVariablesController {

    /**
     * \@MatrixVariable注解的作用就是用来获取路径变量中的矩阵的变量的，并且可以用基本数据类型来接收。
     *
     * @param pathVar1
     * @param matrixVariable1
     * @param matrixVariable2
     * @return
     */
    @GetMapping("/testMatrixVariables/{pathVar1}")
    public String testMatrixVariables(@PathVariable String pathVar1,
                                      @MatrixVariable int matrixVariable1,
                                      @MatrixVariable int matrixVariable2) {
        return "pathVar1的值为：" + pathVar1 + "; matrixVariable1的值为：" + matrixVariable1 + "; matrixVariable2的值为：" + matrixVariable2;
    }

    /**
     * 指定pathVar属性来获取两个不同路径变量中同名的矩阵变量。
     *
     * @param matrixVariable1
     * @param matrixVariable2
     * @return
     */
    @GetMapping("/testMatrixVariables2/{pathVar1}/{pathVar2}")
    public String testMatrixVariables2(@MatrixVariable(name = "matrixVariable", pathVar = "pathVar1") int matrixVariable1,
                                       @MatrixVariable(name = "matrixVariable", pathVar = "pathVar2") int matrixVariable2) {
        return " pathVar1变量中的matrixVariable的值为：" + matrixVariable1 + "; pathVar2变量中的matrixVariable的值为：" + matrixVariable2;
    }

    /**
     * 指定默认值
     *
     * @param pathVar
     * @param matrixVariable
     * @return
     */
    @GetMapping("/testMatrixVariables3/{pathVar}")
    public String testMatrixVariables3(@PathVariable String pathVar,
                                       @MatrixVariable(name = "matrixVariable", pathVar = "pathVar", required = false, defaultValue = "222233") String matrixVariable) {
        return "pathVar变量的值是：" + pathVar + ",matrixVariable变量什么值也没传，默认值是：" + matrixVariable;
    }

    /**
     * /matrix/testMatrixVariables4/a=a;b=b;c=c/a=aa;b=bb
     *
     * @param matrixMap
     * @return
     */
    @GetMapping("/testMatrixVariables4/{pathVar1}/{pathVar2}")
    public String testMatrixVariables4(@MatrixVariable MultiValueMap<String, String> matrixMap) {
        return matrixMap.toString();
    }

    /**
     * testMatrixVariables5/a=a;b=b;c=c/a=aa;b=bb
     * 指定pathVar ，则只获取路径中
     *
     * @param matrixMap
     * @return
     */
    @GetMapping("/testMatrixVariables5/{pathVar1}/{pathVar2}")
    public String testMatrixVariables5(@MatrixVariable(pathVar = "pathVar1") MultiValueMap<String, String> matrixMap) {
        return matrixMap.toString();
    }
}
